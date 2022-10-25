.class Lcom/vk/sharing/target/TargetsLoader$1;
.super Ljava/lang/Object;
.source "TargetsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetDialogsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V
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
    .line 100
    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onDialogsLoaded$0(Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "targets"    # Ljava/util/ArrayList;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0, p1}, Lcom/vk/sharing/target/TargetsLoader;->access$400(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$onError$1()V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$300(Lcom/vk/sharing/target/TargetsLoader;)V

    return-void
.end method

.method public onDialogsLoaded(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "dlgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    iget-object v1, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v1}, Lcom/vk/sharing/target/TargetsLoader;->access$000(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 104
    invoke-static {p1}, Lcom/vk/sharing/target/TargetsLoader;->access$100(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    .line 105
    .local v0, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v1, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v1}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v1

    invoke-static {p0, v0}, Lcom/vk/sharing/target/TargetsLoader$1$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$1;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 106
    return-void
.end method

.method public onError(ILjava/lang/String;)V
    .locals 2
    .param p1, "ecode"    # I
    .param p2, "emsg"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$000(Lcom/vk/sharing/target/TargetsLoader;)V

    .line 111
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$1;->this$0:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0}, Lcom/vk/sharing/target/TargetsLoader;->access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader$1$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$1;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 112
    return-void
.end method
