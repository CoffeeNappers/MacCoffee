.class public Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 92
    const-class v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 93
    return-void
.end method


# virtual methods
.method public fromSignup(Z)Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Builder;
    .locals 2
    .param p1, "fromSignup"    # Z

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "from_signup"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 97
    return-object p0
.end method
