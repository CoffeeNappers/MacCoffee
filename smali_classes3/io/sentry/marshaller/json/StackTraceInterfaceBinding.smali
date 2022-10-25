.class public Lio/sentry/marshaller/json/StackTraceInterfaceBinding;
.super Ljava/lang/Object;
.source "StackTraceInterfaceBinding.java"

# interfaces
.implements Lio/sentry/marshaller/json/InterfaceBinding;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/sentry/marshaller/json/InterfaceBinding",
        "<",
        "Lio/sentry/event/interfaces/StackTraceInterface;",
        ">;"
    }
.end annotation


# static fields
.field private static final ABSOLUTE_PATH_PARAMETER:Ljava/lang/String; = "abs_path"

.field private static final COL_NO_PARAMETER:Ljava/lang/String; = "colno"

.field private static final CONTEXT_LINE_PARAMETER:Ljava/lang/String; = "context_line"

.field private static final FILENAME_PARAMETER:Ljava/lang/String; = "filename"

.field private static final FRAMES_PARAMETER:Ljava/lang/String; = "frames"

.field private static final FUNCTION_PARAMETER:Ljava/lang/String; = "function"

.field private static final IN_APP_PARAMETER:Ljava/lang/String; = "in_app"

.field private static final LINE_NO_PARAMETER:Ljava/lang/String; = "lineno"

.field private static final MODULE_PARAMETER:Ljava/lang/String; = "module"

.field private static final PLATFORM_PARAMTER:Ljava/lang/String; = "platform"

.field private static final POST_CONTEXT_PARAMETER:Ljava/lang/String; = "post_context"

.field private static final PRE_CONTEXT_PARAMETER:Ljava/lang/String; = "pre_context"

.field private static final VARIABLES_PARAMETER:Ljava/lang/String; = "vars"


# instance fields
.field private inAppFrames:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private removeCommonFramesWithEnclosing:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->inAppFrames:Ljava/util/Collection;

    .line 30
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->removeCommonFramesWithEnclosing:Z

    return-void
.end method

.method private isFrameInApp(Lio/sentry/event/interfaces/SentryStackTraceElement;)Z
    .locals 4
    .param p1, "stackTraceElement"    # Lio/sentry/event/interfaces/SentryStackTraceElement;

    .prologue
    .line 79
    iget-object v3, p0, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->inAppFrames:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 80
    .local v2, "inAppFrame":Ljava/lang/String;
    invoke-virtual {p1}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getModule()Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "className":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 82
    const/4 v3, 0x1

    .line 85
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "inAppFrame":Ljava/lang/String;
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private writeFrame(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/SentryStackTraceElement;Z)V
    .locals 7
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "stackTraceElement"    # Lio/sentry/event/interfaces/SentryStackTraceElement;
    .param p3, "commonWithEnclosing"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 40
    const-string/jumbo v5, "filename"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const-string/jumbo v5, "module"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getModule()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    iget-boolean v5, p0, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->removeCommonFramesWithEnclosing:Z

    if-eqz v5, :cond_0

    if-nez p3, :cond_4

    :cond_0
    invoke-direct {p0, p2}, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->isFrameInApp(Lio/sentry/event/interfaces/SentryStackTraceElement;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/4 v1, 0x1

    .line 43
    .local v1, "inApp":Z
    :goto_0
    const-string/jumbo v5, "in_app"

    invoke-virtual {p1, v5, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 44
    const-string/jumbo v5, "function"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getFunction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const-string/jumbo v5, "lineno"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getLineno()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 48
    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getColno()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 49
    const-string/jumbo v5, "colno"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getColno()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 52
    :cond_1
    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getPlatform()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 53
    const-string/jumbo v5, "platform"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getPlatform()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    :cond_2
    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getAbsPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 57
    const-string/jumbo v5, "abs_path"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getAbsPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    :cond_3
    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getLocals()Ljava/util/Map;

    move-result-object v5

    if-eqz v5, :cond_7

    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getLocals()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7

    .line 61
    const-string/jumbo v5, "vars"

    invoke-virtual {p1, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p2}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getLocals()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 63
    .local v4, "varEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 64
    .local v2, "name":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 65
    .local v3, "value":Ljava/lang/Object;
    if-nez v3, :cond_5

    .line 66
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNullField(Ljava/lang/String;)V

    goto :goto_1

    .line 42
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "inApp":Z
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    .end local v4    # "varEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_4
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 68
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "inApp":Z
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "value":Ljava/lang/Object;
    .restart local v4    # "varEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 71
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    .end local v4    # "varEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_6
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 74
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_7
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 75
    return-void
.end method


# virtual methods
.method public setInAppFrames(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "inAppFrames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->inAppFrames:Ljava/util/Collection;

    .line 107
    return-void
.end method

.method public setRemoveCommonFramesWithEnclosing(Z)V
    .locals 0
    .param p1, "removeCommonFramesWithEnclosing"    # Z

    .prologue
    .line 102
    iput-boolean p1, p0, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->removeCommonFramesWithEnclosing:Z

    .line 103
    return-void
.end method

.method public bridge synthetic writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/SentryInterface;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15
    check-cast p2, Lio/sentry/event/interfaces/StackTraceInterface;

    invoke-virtual {p0, p1, p2}, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/StackTraceInterface;)V

    return-void
.end method

.method public writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/StackTraceInterface;)V
    .locals 6
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "stackTraceInterface"    # Lio/sentry/event/interfaces/StackTraceInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 91
    const-string/jumbo v4, "frames"

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 92
    invoke-virtual {p2}, Lio/sentry/event/interfaces/StackTraceInterface;->getStackTrace()[Lio/sentry/event/interfaces/SentryStackTraceElement;

    move-result-object v3

    .line 93
    .local v3, "sentryStackTrace":[Lio/sentry/event/interfaces/SentryStackTraceElement;
    invoke-virtual {p2}, Lio/sentry/event/interfaces/StackTraceInterface;->getFramesCommonWithEnclosing()I

    move-result v0

    .line 94
    .local v0, "commonWithEnclosing":I
    array-length v4, v3

    add-int/lit8 v2, v4, -0x1

    .local v2, "i":I
    move v1, v0

    .end local v0    # "commonWithEnclosing":I
    .local v1, "commonWithEnclosing":I
    :goto_0
    if-ltz v2, :cond_1

    .line 95
    aget-object v5, v3, v2

    add-int/lit8 v0, v1, -0x1

    .end local v1    # "commonWithEnclosing":I
    .restart local v0    # "commonWithEnclosing":I
    if-lez v1, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-direct {p0, p1, v5, v4}, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->writeFrame(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/SentryStackTraceElement;Z)V

    .line 94
    add-int/lit8 v2, v2, -0x1

    move v1, v0

    .end local v0    # "commonWithEnclosing":I
    .restart local v1    # "commonWithEnclosing":I
    goto :goto_0

    .line 95
    .end local v1    # "commonWithEnclosing":I
    .restart local v0    # "commonWithEnclosing":I
    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .line 97
    .end local v0    # "commonWithEnclosing":I
    .restart local v1    # "commonWithEnclosing":I
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 98
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 99
    return-void
.end method
