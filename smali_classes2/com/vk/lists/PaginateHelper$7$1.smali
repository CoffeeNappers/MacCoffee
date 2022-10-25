.class Lcom/vk/lists/PaginateHelper$7$1;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/PaginateHelper$7;->apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/lists/PaginateHelper$7;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper$7;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/lists/PaginateHelper$7;

    .prologue
    .line 353
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$7$1;->this$1:Lcom/vk/lists/PaginateHelper$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 356
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$7$1;->this$1:Lcom/vk/lists/PaginateHelper$7;

    iget-object v0, v0, Lcom/vk/lists/PaginateHelper$7;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$1200(Lcom/vk/lists/PaginateHelper;)V

    .line 357
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$7$1;->this$1:Lcom/vk/lists/PaginateHelper$7;

    iget-object v0, v0, Lcom/vk/lists/PaginateHelper$7;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$300(Lcom/vk/lists/PaginateHelper;)V

    .line 358
    return-void
.end method
