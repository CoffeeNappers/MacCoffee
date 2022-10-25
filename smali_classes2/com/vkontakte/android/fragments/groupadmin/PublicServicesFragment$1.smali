.class Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PublicServicesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->access$002(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->access$100(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;)V

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->dataLoaded()V

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->invalidateOptionsMenu()V

    .line 94
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 87
    check-cast p1, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;->success(Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)V

    return-void
.end method
