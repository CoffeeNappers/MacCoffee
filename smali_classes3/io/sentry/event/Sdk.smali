.class public Lio/sentry/event/Sdk;
.super Ljava/lang/Object;
.source "Sdk.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private integrations:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "integrations":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lio/sentry/event/Sdk;->name:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lio/sentry/event/Sdk;->version:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lio/sentry/event/Sdk;->integrations:Ljava/util/Set;

    .line 34
    return-void
.end method


# virtual methods
.method public getIntegrations()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lio/sentry/event/Sdk;->integrations:Ljava/util/Set;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lio/sentry/event/Sdk;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lio/sentry/event/Sdk;->version:Ljava/lang/String;

    return-object v0
.end method
