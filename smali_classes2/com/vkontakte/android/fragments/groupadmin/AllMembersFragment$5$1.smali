.class Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "AllMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;->this$0:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->access$900(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;->val$user:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;->this$0:Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->updateList()V

    .line 230
    return-void
.end method
