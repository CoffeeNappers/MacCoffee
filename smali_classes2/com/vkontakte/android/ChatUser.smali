.class public Lcom/vkontakte/android/ChatUser;
.super Ljava/lang/Object;
.source "ChatUser.java"


# instance fields
.field public admin:I

.field public inviter:Lcom/vkontakte/android/UserProfile;

.field public user:Lcom/vkontakte/android/UserProfile;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ChatUser;->admin:I

    .line 9
    return-void
.end method


# virtual methods
.method public isAdmin()Z
    .locals 2

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget v1, p0, Lcom/vkontakte/android/ChatUser;->admin:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
