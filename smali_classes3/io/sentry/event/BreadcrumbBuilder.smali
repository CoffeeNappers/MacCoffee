.class public Lio/sentry/event/BreadcrumbBuilder;
.super Ljava/lang/Object;
.source "BreadcrumbBuilder.java"


# instance fields
.field private category:Ljava/lang/String;

.field private data:Ljava/util/Map;
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

.field private level:Lio/sentry/event/Breadcrumb$Level;

.field private message:Ljava/lang/String;

.field private timestamp:Ljava/util/Date;

.field private type:Lio/sentry/event/Breadcrumb$Type;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/sentry/event/Breadcrumb;
    .locals 7

    .prologue
    .line 92
    new-instance v0, Lio/sentry/event/Breadcrumb;

    iget-object v1, p0, Lio/sentry/event/BreadcrumbBuilder;->type:Lio/sentry/event/Breadcrumb$Type;

    iget-object v2, p0, Lio/sentry/event/BreadcrumbBuilder;->timestamp:Ljava/util/Date;

    iget-object v3, p0, Lio/sentry/event/BreadcrumbBuilder;->level:Lio/sentry/event/Breadcrumb$Level;

    iget-object v4, p0, Lio/sentry/event/BreadcrumbBuilder;->message:Ljava/lang/String;

    iget-object v5, p0, Lio/sentry/event/BreadcrumbBuilder;->category:Ljava/lang/String;

    iget-object v6, p0, Lio/sentry/event/BreadcrumbBuilder;->data:Ljava/util/Map;

    invoke-direct/range {v0 .. v6}, Lio/sentry/event/Breadcrumb;-><init>(Lio/sentry/event/Breadcrumb$Type;Ljava/util/Date;Lio/sentry/event/Breadcrumb$Level;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method public setCategory(Ljava/lang/String;)Lio/sentry/event/BreadcrumbBuilder;
    .locals 0
    .param p1, "newCategory"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lio/sentry/event/BreadcrumbBuilder;->category:Ljava/lang/String;

    .line 71
    return-object p0
.end method

.method public setData(Ljava/util/Map;)Lio/sentry/event/BreadcrumbBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/sentry/event/BreadcrumbBuilder;"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "newData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lio/sentry/event/BreadcrumbBuilder;->data:Ljava/util/Map;

    .line 83
    return-object p0
.end method

.method public setLevel(Lio/sentry/event/Breadcrumb$Level;)Lio/sentry/event/BreadcrumbBuilder;
    .locals 0
    .param p1, "newLevel"    # Lio/sentry/event/Breadcrumb$Level;

    .prologue
    .line 47
    iput-object p1, p0, Lio/sentry/event/BreadcrumbBuilder;->level:Lio/sentry/event/Breadcrumb$Level;

    .line 48
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lio/sentry/event/BreadcrumbBuilder;
    .locals 0
    .param p1, "newMessage"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lio/sentry/event/BreadcrumbBuilder;->message:Ljava/lang/String;

    .line 60
    return-object p0
.end method

.method public setTimestamp(Ljava/util/Date;)Lio/sentry/event/BreadcrumbBuilder;
    .locals 4
    .param p1, "newTimestamp"    # Ljava/util/Date;

    .prologue
    .line 36
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lio/sentry/event/BreadcrumbBuilder;->timestamp:Ljava/util/Date;

    .line 37
    return-object p0
.end method

.method public setType(Lio/sentry/event/Breadcrumb$Type;)Lio/sentry/event/BreadcrumbBuilder;
    .locals 0
    .param p1, "newType"    # Lio/sentry/event/Breadcrumb$Type;

    .prologue
    .line 25
    iput-object p1, p0, Lio/sentry/event/BreadcrumbBuilder;->type:Lio/sentry/event/Breadcrumb$Type;

    .line 26
    return-object p0
.end method
