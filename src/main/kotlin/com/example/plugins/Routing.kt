package com.example.plugins

import com.example.dao.dao
import com.example.dao.daoCampo
import io.ktor.server.routing.*
import io.ktor.server.response.*
import io.ktor.server.http.content.*
import io.ktor.server.application.*

import io.ktor.server.freemarker.*
import io.ktor.server.request.*
import io.ktor.server.util.*

fun Application.configureRouting() {
    
    routing {
        get("/") {
            call.respondRedirect("articles")
        }

        // Static plugin. Try to access `/static/index.html`
        static("/static") {
            resources("static")
        }

        route("articles") {
            get {
                call.respond(FreeMarkerContent("index.ftl", mapOf("articles" to dao.allArticles())))
            }

            get("new") {
                call.respond(FreeMarkerContent("new.ftl", model = null))
            }

            post {
                val formParameters = call.receiveParameters()
                val title = formParameters.getOrFail("title")
                val body = formParameters.getOrFail("body")
                val article = dao.addNewArticle(title, body)
                call.respondRedirect("/articles/${article?.id}")
            }

            get("{id}") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("show.ftl", mapOf("article" to dao.article(id), "campos" to daoCampo.campoart(id))))
            }

            get("{id}/edit") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("edit.ftl", mapOf("article" to dao.article(id))))
            }

            post("{id}") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val seasonId: Int = id
                val formParameters = call.receiveParameters()
                when (formParameters.getOrFail("_action")) {
                    "update" -> {
                        val title = formParameters.getOrFail("title")
                        val body = formParameters.getOrFail("body")
                        dao.editArticle(id, title, body)
                        call.respondRedirect("/articles/$id")
                    }
                    "delete" -> {
                        daoCampo.deleteCamposArt(seasonId)
                        dao.deleteArticle(id)
                        call.respondRedirect("/articles")
                    }
                }
            }
        }

        route("campos") {
            get {
                call.respond(FreeMarkerContent("indexCampo.ftl", mapOf("campos" to daoCampo.allCampos())))
            }

            get("newCampo") {
                call.respond(FreeMarkerContent("newCampo.ftl", mapOf("articles" to dao.allArticles())))
            }

            post {
                val formParameters = call.receiveParameters()
                val value = formParameters.getOrFail("valor")
                val name = formParameters.getOrFail("nombre")
                val description = formParameters.getOrFail("descripcion")
                val seasonId = formParameters.getOrFail("idtemporada").toInt()
                val order = formParameters.getOrFail("orden").toInt()
                val campo = daoCampo.addNewCampos(value, name, description, seasonId, order)
                call.respondRedirect("/campos/${campo?.id}")
            }

            get("{id}") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("showCampo.ftl", mapOf("campo" to daoCampo.campo(id))))
            }

            get("{id}/editCampo") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("editCampo.ftl", mapOf("campo" to daoCampo.campo(id), "articles" to dao.allArticles())))
            }

            post("{id}") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val formParameters = call.receiveParameters()
                when (formParameters.getOrFail("_action")) {
                    "update" -> {
                        val value = formParameters.getOrFail("valor")
                        val name = formParameters.getOrFail("nombre")
                        val description = formParameters.getOrFail("descripcion")
                        val seasonId = formParameters.getOrFail("idtemporada").toInt()
                        val order = formParameters.getOrFail("orden").toInt()
                        daoCampo.editCampos(id, value, name, description, seasonId, order)
                        call.respondRedirect("/campos/$id")
                    }
                    "delete" -> {
                        daoCampo.deleteCampos(id)
                        call.respondRedirect("/campos")
                    }
                }
            }
        }
    }
}
