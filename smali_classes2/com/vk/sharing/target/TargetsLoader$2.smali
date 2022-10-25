.class Lcom/vk/sharing/target/TargetsLoader$2;
.super Ljava/lang/Object;
.source "TargetsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/data/Groups$GetGroupsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/target/TargetsLoader;->loadGroups()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/target/TargetsLoader;


# direct methods
.method constructor <init>(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$1()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$700(Lcom/vk/sharing/target/TargetsLoader;)V

    return-void
.end method

.method synthetic lambda$onResult$0(Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "targets"    # Ljava/util/ArrayList;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0, p1}, Lcom/vk/sharing/target/TargetsLoader;->access$800(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)V

    return-void
.end method

.method public onError()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$500(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 134
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader$2$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$2;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 135
    return-void
.end method

.method public onResult(Ljava/util/List;)V
    .locals 3
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
    .line 126
    .local p1, "groups":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    iget-object v1, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v1}, Lcom/vk/sharing/target/TargetsLoader;->access$500(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 127
    invoke-static {p1}, Lcom/vk/sharing/target/TargetsLoader;->access$600(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    .line 128
    .local v0, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v1, p0, Lcom/vk/sharing/target/TargetsLoader$2;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v1}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v1

    invoke-static {p0, v0}, Lcom/vk/sharing/target/TargetsLoader$2$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$2;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 129
    return-void
.end method
