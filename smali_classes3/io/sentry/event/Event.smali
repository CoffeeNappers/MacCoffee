.class public Lio/sentry/event/Event;
.super Ljava/lang/Object;
.source "Event.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/event/Event$Level;
    }
.end annotation


# instance fields
.field private breadcrumbs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;"
        }
    .end annotation
.end field

.field private checksum:Ljava/lang/String;

.field private contexts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private culprit:Ljava/lang/String;

.field private dist:Ljava/lang/String;

.field private environment:Ljava/lang/String;

.field private transient extra:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private fingerprint:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final id:Ljava/util/UUID;

.field private level:Lio/sentry/event/Event$Level;

.field private logger:Ljava/lang/String;

.field private message:Ljava/lang/String;

.field private platform:Ljava/lang/String;

.field private release:Ljava/lang/String;

.field private sdk:Lio/sentry/event/Sdk;

.field private sentryInterfaces:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lio/sentry/event/interfaces/SentryInterface;",
            ">;"
        }
    .end annotation
.end field

.field private serverName:Ljava/lang/String;

.field private tags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private timestamp:Ljava/util/Date;


# direct methods
.method constructor <init>(Ljava/util/UUID;)V
    .locals 2
    .param p1, "id"    # Ljava/util/UUID;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/event/Event;->tags:Ljava/util/Map;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/sentry/event/Event;->breadcrumbs:Ljava/util/List;

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/event/Event;->contexts:Ljava/util/Map;

    .line 104
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/event/Event;->extra:Ljava/util/Map;

    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/event/Event;->sentryInterfaces:Ljava/util/Map;

    .line 127
    if-nez p1, :cond_0

    .line 128
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The id can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_0
    iput-object p1, p0, Lio/sentry/event/Event;->id:Ljava/util/UUID;

    .line 131
    return-void
.end method

.method private static convertToSerializable(Ljava/util/Map;)Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "-",
            "Ljava/io/Serializable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 305
    .local p0, "objectMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 306
    .local v2, "serializableMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;-Ljava/io/Serializable;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 307
    .local v1, "objectEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/io/Serializable;

    if-eqz v3, :cond_0

    .line 308
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/Serializable;

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 310
    :cond_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 313
    .end local v1    # "objectEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-object v2
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 285
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lio/sentry/event/Event;->extra:Ljava/util/Map;

    .line 286
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 291
    iget-object v0, p0, Lio/sentry/event/Event;->extra:Ljava/util/Map;

    invoke-static {v0}, Lio/sentry/event/Event;->convertToSerializable(Ljava/util/Map;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 292
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 319
    if-ne p0, p1, :cond_0

    .line 320
    const/4 v0, 0x1

    .line 326
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .line 322
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 323
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 326
    :cond_2
    iget-object v0, p0, Lio/sentry/event/Event;->id:Ljava/util/UUID;

    check-cast p1, Lio/sentry/event/Event;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lio/sentry/event/Event;->id:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public getBreadcrumbs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;"
        }
    .end annotation

    .prologue
    .line 194
    iget-object v0, p0, Lio/sentry/event/Event;->breadcrumbs:Ljava/util/List;

    return-object v0
.end method

.method public getChecksum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lio/sentry/event/Event;->checksum:Ljava/lang/String;

    return-object v0
.end method

.method public getContexts()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lio/sentry/event/Event;->contexts:Ljava/util/Map;

    return-object v0
.end method

.method public getCulprit()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lio/sentry/event/Event;->culprit:Ljava/lang/String;

    return-object v0
.end method

.method public getDist()Ljava/lang/String;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lio/sentry/event/Event;->dist:Ljava/lang/String;

    return-object v0
.end method

.method public getEnvironment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lio/sentry/event/Event;->environment:Ljava/lang/String;

    return-object v0
.end method

.method public getExtra()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 250
    iget-object v0, p0, Lio/sentry/event/Event;->extra:Ljava/util/Map;

    return-object v0
.end method

.method public getFingerprint()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 258
    iget-object v0, p0, Lio/sentry/event/Event;->fingerprint:Ljava/util/List;

    return-object v0
.end method

.method public getId()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lio/sentry/event/Event;->id:Ljava/util/UUID;

    return-object v0
.end method

.method public getLevel()Lio/sentry/event/Event$Level;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lio/sentry/event/Event;->level:Lio/sentry/event/Event$Level;

    return-object v0
.end method

.method public getLogger()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lio/sentry/event/Event;->logger:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lio/sentry/event/Event;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lio/sentry/event/Event;->platform:Ljava/lang/String;

    return-object v0
.end method

.method public getRelease()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lio/sentry/event/Event;->release:Ljava/lang/String;

    return-object v0
.end method

.method public getSdk()Lio/sentry/event/Sdk;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lio/sentry/event/Event;->sdk:Lio/sentry/event/Sdk;

    return-object v0
.end method

.method public getSentryInterfaces()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lio/sentry/event/interfaces/SentryInterface;",
            ">;"
        }
    .end annotation

    .prologue
    .line 274
    iget-object v0, p0, Lio/sentry/event/Event;->sentryInterfaces:Ljava/util/Map;

    return-object v0
.end method

.method public getServerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lio/sentry/event/Event;->serverName:Ljava/lang/String;

    return-object v0
.end method

.method public getTags()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 210
    iget-object v0, p0, Lio/sentry/event/Event;->tags:Ljava/util/Map;

    return-object v0
.end method

.method public getTimestamp()Ljava/util/Date;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lio/sentry/event/Event;->timestamp:Ljava/util/Date;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/sentry/event/Event;->timestamp:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lio/sentry/event/Event;->id:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    return v0
.end method

.method setBreadcrumbs(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 198
    .local p1, "breadcrumbs":Ljava/util/List;, "Ljava/util/List<Lio/sentry/event/Breadcrumb;>;"
    iput-object p1, p0, Lio/sentry/event/Event;->breadcrumbs:Ljava/util/List;

    .line 199
    return-void
.end method

.method setChecksum(Ljava/lang/String;)V
    .locals 0
    .param p1, "checksum"    # Ljava/lang/String;

    .prologue
    .line 270
    iput-object p1, p0, Lio/sentry/event/Event;->checksum:Ljava/lang/String;

    .line 271
    return-void
.end method

.method public setContexts(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 206
    .local p1, "contexts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lio/sentry/event/Event;->contexts:Ljava/util/Map;

    .line 207
    return-void
.end method

.method setCulprit(Ljava/lang/String;)V
    .locals 0
    .param p1, "culprit"    # Ljava/lang/String;

    .prologue
    .line 190
    iput-object p1, p0, Lio/sentry/event/Event;->culprit:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public setDist(Ljava/lang/String;)V
    .locals 0
    .param p1, "dist"    # Ljava/lang/String;

    .prologue
    .line 238
    iput-object p1, p0, Lio/sentry/event/Event;->dist:Ljava/lang/String;

    .line 239
    return-void
.end method

.method setEnvironment(Ljava/lang/String;)V
    .locals 0
    .param p1, "environment"    # Ljava/lang/String;

    .prologue
    .line 246
    iput-object p1, p0, Lio/sentry/event/Event;->environment:Ljava/lang/String;

    .line 247
    return-void
.end method

.method setExtra(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 254
    .local p1, "extra":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lio/sentry/event/Event;->extra:Ljava/util/Map;

    .line 255
    return-void
.end method

.method public setFingerprint(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "fingerprint":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lio/sentry/event/Event;->fingerprint:Ljava/util/List;

    .line 263
    return-void
.end method

.method setLevel(Lio/sentry/event/Event$Level;)V
    .locals 0
    .param p1, "level"    # Lio/sentry/event/Event$Level;

    .prologue
    .line 158
    iput-object p1, p0, Lio/sentry/event/Event;->level:Lio/sentry/event/Event$Level;

    .line 159
    return-void
.end method

.method setLogger(Ljava/lang/String;)V
    .locals 0
    .param p1, "logger"    # Ljava/lang/String;

    .prologue
    .line 166
    iput-object p1, p0, Lio/sentry/event/Event;->logger:Ljava/lang/String;

    .line 167
    return-void
.end method

.method setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lio/sentry/event/Event;->message:Ljava/lang/String;

    .line 143
    return-void
.end method

.method setPlatform(Ljava/lang/String;)V
    .locals 0
    .param p1, "platform"    # Ljava/lang/String;

    .prologue
    .line 174
    iput-object p1, p0, Lio/sentry/event/Event;->platform:Ljava/lang/String;

    .line 175
    return-void
.end method

.method setRelease(Ljava/lang/String;)V
    .locals 0
    .param p1, "release"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lio/sentry/event/Event;->release:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public setSdk(Lio/sentry/event/Sdk;)V
    .locals 0
    .param p1, "sdk"    # Lio/sentry/event/Sdk;

    .prologue
    .line 182
    iput-object p1, p0, Lio/sentry/event/Event;->sdk:Lio/sentry/event/Sdk;

    .line 183
    return-void
.end method

.method setSentryInterfaces(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lio/sentry/event/interfaces/SentryInterface;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 278
    .local p1, "sentryInterfaces":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lio/sentry/event/interfaces/SentryInterface;>;"
    iput-object p1, p0, Lio/sentry/event/Event;->sentryInterfaces:Ljava/util/Map;

    .line 279
    return-void
.end method

.method setServerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverName"    # Ljava/lang/String;

    .prologue
    .line 222
    iput-object p1, p0, Lio/sentry/event/Event;->serverName:Ljava/lang/String;

    .line 223
    return-void
.end method

.method setTags(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 214
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lio/sentry/event/Event;->tags:Ljava/util/Map;

    .line 215
    return-void
.end method

.method setTimestamp(Ljava/util/Date;)V
    .locals 0
    .param p1, "timestamp"    # Ljava/util/Date;

    .prologue
    .line 150
    iput-object p1, p0, Lio/sentry/event/Event;->timestamp:Ljava/util/Date;

    .line 151
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Event{level="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/Event;->level:Lio/sentry/event/Event$Level;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/Event;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", logger=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/Event;->logger:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
