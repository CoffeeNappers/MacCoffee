.class Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "InvitationsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;->onItemButtonClick(Landroid/view/View;Lcom/vkontakte/android/UserProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;

.field final synthetic val$user:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;Landroid/content/Context;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment$1;->val$user:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;->access$000(Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment$1;->val$user:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/InvitationsFragment;->updateList()V

    .line 34
    return-void
.end method
