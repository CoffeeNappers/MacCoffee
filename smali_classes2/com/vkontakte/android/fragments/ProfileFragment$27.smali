.class Lcom/vkontakte/android/fragments/ProfileFragment$27;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->lambda$editFriendLists$39([ZLjava/util/ArrayList;Lcom/vkontakte/android/UserProfile;Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$newMask:I

.field final synthetic val$p:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Lcom/vkontakte/android/UserProfile;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3045
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$27;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$27;->val$p:Lcom/vkontakte/android/UserProfile;

    iput p4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$27;->val$newMask:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 3048
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$27;->val$p:Lcom/vkontakte/android/UserProfile;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$27;->val$newMask:I

    iput v1, v0, Lcom/vkontakte/android/UserProfile;->country:I

    .line 3049
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$27;->val$p:Lcom/vkontakte/android/UserProfile;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/cache/Cache;->updateFriends(Ljava/util/List;Z)V

    .line 3050
    return-void
.end method
