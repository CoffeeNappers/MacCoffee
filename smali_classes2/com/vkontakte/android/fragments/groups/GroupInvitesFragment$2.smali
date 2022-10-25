.class Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$2;
.super Lcom/vkontakte/android/api/SimpleListCallback;
.source "GroupInvitesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleListCallback",
        "<",
        "Lcom/vkontakte/android/api/GroupInvitation;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    .prologue
    .line 104
    .local p2, "fragment":Lme/grishka/appkit/fragments/BaseRecyclerFragment;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment<Lcom/vkontakte/android/api/GroupInvitation;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/GroupInvitation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "list":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/GroupInvitation;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleListCallback;->success(Lcom/vkontakte/android/data/VKList;)V

    .line 108
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->setNumGroupInvitations(I)V

    .line 109
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.GROUP_INVITES_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 110
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 104
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
