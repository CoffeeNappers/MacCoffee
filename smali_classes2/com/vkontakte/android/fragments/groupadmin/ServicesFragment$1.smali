.class Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ServicesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->doLoadData()V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->access$002(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->access$100(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;)V

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->dataLoaded()V

    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->invalidateOptionsMenu()V

    .line 113
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 106
    check-cast p1, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;->success(Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)V

    return-void
.end method
