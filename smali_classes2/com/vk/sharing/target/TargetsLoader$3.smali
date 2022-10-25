.class Lcom/vk/sharing/target/TargetsLoader$3;
.super Ljava/lang/Object;
.source "TargetsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/target/TargetsLoader;->loadGroupsForImpersonation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/target/TargetsLoader;

.field final synthetic val$adminedGroupId:I


# direct methods
.method constructor <init>(Lcom/vk/sharing/target/TargetsLoader;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    iput p2, p0, Lcom/vk/sharing/target/TargetsLoader$3;->val$adminedGroupId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$500(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 192
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader$3$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$3;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 193
    return-void
.end method

.method synthetic lambda$fail$0()V
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$700(Lcom/vk/sharing/target/TargetsLoader;)V

    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 148
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vk/sharing/target/TargetsLoader$3;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p1, "impersGroups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    const/4 v0, 0x2

    new-instance v1, Lcom/vk/sharing/target/TargetsLoader$3$1;

    invoke-direct {v1, p0, p1}, Lcom/vk/sharing/target/TargetsLoader$3$1;-><init>(Lcom/vk/sharing/target/TargetsLoader$3;Ljava/util/ArrayList;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Groups;->getGroups(ILcom/vkontakte/android/data/Groups$GetGroupsCallback;)V

    .line 187
    return-void
.end method
