.class public Lio/sentry/event/User;
.super Ljava/lang/Object;
.source "User.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final email:Ljava/lang/String;

.field private final id:Ljava/lang/String;

.field private final ipAddress:Ljava/lang/String;

.field private final username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;
    .param p3, "ipAddress"    # Ljava/lang/String;
    .param p4, "email"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lio/sentry/event/User;->id:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lio/sentry/event/User;->username:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lio/sentry/event/User;->ipAddress:Ljava/lang/String;

    .line 30
    iput-object p4, p0, Lio/sentry/event/User;->email:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lio/sentry/event/User;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lio/sentry/event/User;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getIpAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lio/sentry/event/User;->ipAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lio/sentry/event/User;->username:Ljava/lang/String;

    return-object v0
.end method
