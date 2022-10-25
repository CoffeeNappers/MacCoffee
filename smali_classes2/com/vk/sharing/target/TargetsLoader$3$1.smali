.class Lcom/vk/sharing/target/TargetsLoader$3$1;
.super Ljava/lang/Object;
.source "TargetsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/data/Groups$GetGroupsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/target/TargetsLoader$3;->success(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/sharing/target/TargetsLoader$3;

.field final synthetic val$impersGroups:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vk/sharing/target/TargetsLoader$3;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/sharing/target/TargetsLoader$3;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iput-object p2, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->val$impersGroups:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$1()V
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget-object v0, v0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$700(Lcom/vk/sharing/target/TargetsLoader;)V

    return-void
.end method

.method synthetic lambda$onResult$0(Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "targets"    # Ljava/util/ArrayList;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget-object v0, v0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0, p1}, Lcom/vk/sharing/target/TargetsLoader;->access$800(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)V

    return-void
.end method

.method public onError()V
    .locals 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget-object v0, v0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$500(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 184
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget-object v0, v0, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$3$1;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 185
    return-void
.end method

.method public onResult(Ljava/util/List;)V
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "adminedGroups":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    iget-object v3, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget-object v3, v3, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v3}, Lcom/vk/sharing/target/TargetsLoader;->access$500(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 157
    new-instance v0, Lcom/vkontakte/android/api/Group;

    invoke-direct {v0}, Lcom/vkontakte/android/api/Group;-><init>()V

    .line 158
    .local v0, "admGroup":Lcom/vkontakte/android/api/Group;
    iget-object v3, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget v3, v3, Lcom/vk/sharing/target/TargetsLoader$3;->val$adminedGroupId:I

    iput v3, v0, Lcom/vkontakte/android/api/Group;->id:I

    .line 160
    iget-object v3, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->val$impersGroups:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 168
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    .line 170
    .local v1, "g":Lcom/vkontakte/android/api/Group;
    iget v4, v1, Lcom/vkontakte/android/api/Group;->id:I

    iget-object v5, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget v5, v5, Lcom/vk/sharing/target/TargetsLoader$3;->val$adminedGroupId:I

    if-ne v4, v5, :cond_0

    .line 171
    iget-object v3, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->val$impersGroups:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    .end local v1    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    iget-object v3, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->val$impersGroups:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vk/sharing/target/TargetsLoader;->access$600(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v2

    .line 178
    .local v2, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v3, p0, Lcom/vk/sharing/target/TargetsLoader$3$1;->this$1:Lcom/vk/sharing/target/TargetsLoader$3;

    iget-object v3, v3, Lcom/vk/sharing/target/TargetsLoader$3;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v3}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v3

    invoke-static {p0, v2}, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$3$1;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 179
    return-void
.end method
