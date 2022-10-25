.class Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "LinksFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;->doDelete(Lcom/vkontakte/android/UserProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

.field final synthetic val$link:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;Landroid/content/Context;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;->this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;->val$link:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;->this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;->access$1100(Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;->val$link:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;->this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;->updateList()V

    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$7;->this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;->access$602(Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;Z)Z

    .line 290
    return-void
.end method
