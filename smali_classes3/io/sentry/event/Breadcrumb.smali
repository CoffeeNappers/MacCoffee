.class public Lio/sentry/event/Breadcrumb;
.super Ljava/lang/Object;
.source "Breadcrumb.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/event/Breadcrumb$Type;,
        Lio/sentry/event/Breadcrumb$Level;
    }
.end annotation


# instance fields
.field private final category:Ljava/lang/String;

.field private final data:Ljava/util/Map;
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

.field private final level:Lio/sentry/event/Breadcrumb$Level;

.field private final message:Ljava/lang/String;

.field private final timestamp:Ljava/util/Date;

.field private final type:Lio/sentry/event/Breadcrumb$Type;


# direct methods
.method constructor <init>(Lio/sentry/event/Breadcrumb$Type;Ljava/util/Date;Lio/sentry/event/Breadcrumb$Level;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p1, "type"    # Lio/sentry/event/Breadcrumb$Type;
    .param p2, "timestamp"    # Ljava/util/Date;
    .param p3, "level"    # Lio/sentry/event/Breadcrumb$Level;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "category"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/sentry/event/Breadcrumb$Type;",
            "Ljava/util/Date;",
            "Lio/sentry/event/Breadcrumb$Level;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p6, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    if-nez p2, :cond_0

    .line 138
    new-instance p2, Ljava/util/Date;

    .end local p2    # "timestamp":Ljava/util/Date;
    invoke-direct {p2}, Ljava/util/Date;-><init>()V

    .line 141
    .restart local p2    # "timestamp":Ljava/util/Date;
    :cond_0
    if-nez p4, :cond_2

    if-eqz p6, :cond_1

    invoke-interface {p6}, Ljava/util/Map;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_2

    .line 142
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "one of \'message\' or \'data\' must be set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_2
    iput-object p1, p0, Lio/sentry/event/Breadcrumb;->type:Lio/sentry/event/Breadcrumb$Type;

    .line 146
    iput-object p2, p0, Lio/sentry/event/Breadcrumb;->timestamp:Ljava/util/Date;

    .line 147
    iput-object p3, p0, Lio/sentry/event/Breadcrumb;->level:Lio/sentry/event/Breadcrumb$Level;

    .line 148
    iput-object p4, p0, Lio/sentry/event/Breadcrumb;->message:Ljava/lang/String;

    .line 149
    iput-object p5, p0, Lio/sentry/event/Breadcrumb;->category:Ljava/lang/String;

    .line 150
    iput-object p6, p0, Lio/sentry/event/Breadcrumb;->data:Ljava/util/Map;

    .line 151
    return-void
.end method


# virtual methods
.method public getCategory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lio/sentry/event/Breadcrumb;->category:Ljava/lang/String;

    return-object v0
.end method

.method public getData()Ljava/util/Map;
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
    .line 174
    iget-object v0, p0, Lio/sentry/event/Breadcrumb;->data:Ljava/util/Map;

    return-object v0
.end method

.method public getLevel()Lio/sentry/event/Breadcrumb$Level;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lio/sentry/event/Breadcrumb;->level:Lio/sentry/event/Breadcrumb$Level;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lio/sentry/event/Breadcrumb;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()Ljava/util/Date;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lio/sentry/event/Breadcrumb;->timestamp:Ljava/util/Date;

    return-object v0
.end method

.method public getType()Lio/sentry/event/Breadcrumb$Type;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lio/sentry/event/Breadcrumb;->type:Lio/sentry/event/Breadcrumb$Type;

    return-object v0
.end method
