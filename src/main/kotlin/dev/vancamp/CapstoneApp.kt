package dev.vancamp

import org.http4k.client.Java8HttpClient
import org.http4k.cloudnative.env.Environment
import org.http4k.cloudnative.env.EnvironmentKey
import org.http4k.core.Credentials
import org.http4k.core.then
import org.http4k.filter.DebuggingFilters.PrintRequest
import org.http4k.filter.ServerFilters
import org.http4k.lens.int
import org.http4k.server.Jetty
import org.http4k.server.asServer

val BASIC_AUTH_CREDENTIALS = EnvironmentKey.map(String::toCredentials).required("BASIC_AUTH_CREDENTIALS")
val HTTP_PORT = EnvironmentKey.int().defaulted("HTTP_PORT", 8000)

fun main() {
    val env = Environment.ENV overrides Environment.fromResource("capstone.properties")

    PrintRequest()
        .then(ServerFilters.BasicAuth("capstone", BASIC_AUTH_CREDENTIALS(env)))
        .then(Dropbox(env, Java8HttpClient()))
        .asServer(Jetty(HTTP_PORT(env))).start().block()
}

private fun String.toCredentials() = split(":").run { Credentials(get(0), get(1)) }
