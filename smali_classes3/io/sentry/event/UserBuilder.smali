.class public Lio/sentry/event/UserBuilder;
.super Ljava/lang/Object;
.source "UserBuilder.java"


# instance fields
.field private email:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private ipAddress:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/sentry/event/User;
    .locals 5

    .prologue
    .line 62
    new-instance v0, Lio/sentry/event/User;

    iget-object v1, p0, Lio/sentry/event/UserBuilder;->id:Ljava/lang/String;

    iget-object v2, p0, Lio/sentry/event/UserBuilder;->username:Ljava/lang/String;

    iget-object v3, p0, Lio/sentry/event/UserBuilder;->ipAddress:Ljava/lang/String;

    iget-object v4, p0, Lio/sentry/event/UserBuilder;->email:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lio/sentry/event/User;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public setEmail(Ljava/lang/String;)Lio/sentry/event/UserBuilder;
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lio/sentry/event/UserBuilder;->email:Ljava/lang/String;

    .line 53
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lio/sentry/event/UserBuilder;
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lio/sentry/event/UserBuilder;->id:Ljava/lang/String;

    .line 20
    return-object p0
.end method

.method public setIpAddress(Ljava/lang/String;)Lio/sentry/event/UserBuilder;
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lio/sentry/event/UserBuilder;->ipAddress:Ljava/lang/String;

    .line 42
    return-object p0
.end method

.method public setUsername(Ljava/lang/String;)Lio/sentry/event/UserBuilder;
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lio/sentry/event/UserBuilder;->username:Ljava/lang/String;

    .line 31
    return-object p0
.end method
