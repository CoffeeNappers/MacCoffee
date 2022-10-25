.class public Lio/sentry/marshaller/json/UserInterfaceBinding;
.super Ljava/lang/Object;
.source "UserInterfaceBinding.java"

# interfaces
.implements Lio/sentry/marshaller/json/InterfaceBinding;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/sentry/marshaller/json/InterfaceBinding",
        "<",
        "Lio/sentry/event/interfaces/UserInterface;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMAIL:Ljava/lang/String; = "email"

.field private static final ID:Ljava/lang/String; = "id"

.field private static final IP_ADDRESS:Ljava/lang/String; = "ip_address"

.field private static final USERNAME:Ljava/lang/String; = "username"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/SentryInterface;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 11
    check-cast p2, Lio/sentry/event/interfaces/UserInterface;

    invoke-virtual {p0, p1, p2}, Lio/sentry/marshaller/json/UserInterfaceBinding;->writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/UserInterface;)V

    return-void
.end method

.method public writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/UserInterface;)V
    .locals 2
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "userInterface"    # Lio/sentry/event/interfaces/UserInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 20
    const-string/jumbo v0, "id"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/UserInterface;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    const-string/jumbo v0, "username"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/UserInterface;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    const-string/jumbo v0, "email"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/UserInterface;->getEmail()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    const-string/jumbo v0, "ip_address"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/UserInterface;->getIpAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 25
    return-void
.end method
