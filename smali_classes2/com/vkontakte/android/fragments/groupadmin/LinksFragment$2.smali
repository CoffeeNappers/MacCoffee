.class Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "LinksFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 98
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$2;->success(Ljava/util/List;)V

    return-void
.end method

.method public success(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;Ljava/util/List;Z)V

    .line 102
    return-void
.end method
