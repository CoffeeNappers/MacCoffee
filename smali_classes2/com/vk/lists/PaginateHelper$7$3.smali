.class Lcom/vk/lists/PaginateHelper$7$3;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/PaginateHelper$7;->apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/lists/PaginateHelper$7;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper$7;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/lists/PaginateHelper$7;

    .prologue
    .line 337
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$7$3;->this$1:Lcom/vk/lists/PaginateHelper$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 337
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vk/lists/PaginateHelper$7$3;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 340
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$7$3;->this$1:Lcom/vk/lists/PaginateHelper$7;

    iget-object v0, v0, Lcom/vk/lists/PaginateHelper$7;->this$0:Lcom/vk/lists/PaginateHelper;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/lists/PaginateHelper;->access$202(Lcom/vk/lists/PaginateHelper;Z)Z

    .line 341
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$7$3;->this$1:Lcom/vk/lists/PaginateHelper$7;

    iget-object v0, v0, Lcom/vk/lists/PaginateHelper$7;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$1200(Lcom/vk/lists/PaginateHelper;)V

    .line 342
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$7$3;->this$1:Lcom/vk/lists/PaginateHelper$7;

    iget-object v0, v0, Lcom/vk/lists/PaginateHelper$7;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$300(Lcom/vk/lists/PaginateHelper;)V

    .line 343
    return-void
.end method
