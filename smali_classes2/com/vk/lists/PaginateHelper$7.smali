.class Lcom/vk/lists/PaginateHelper$7;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Lio/reactivex/ObservableTransformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableTransformer",
        "<",
        "Lio/reactivex/Observable",
        "<*>;",
        "Lio/reactivex/Observable",
        "<*>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginateHelper;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 333
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$7;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<*>;>;)",
            "Lio/reactivex/ObservableSource",
            "<",
            "Lio/reactivex/Observable",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 336
    .local p1, "upstream":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lio/reactivex/Observable<*>;>;"
    new-instance v0, Lcom/vk/lists/PaginateHelper$7$3;

    invoke-direct {v0, p0}, Lcom/vk/lists/PaginateHelper$7$3;-><init>(Lcom/vk/lists/PaginateHelper$7;)V

    .line 337
    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->doOnError(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/lists/PaginateHelper$7$2;

    invoke-direct {v1, p0}, Lcom/vk/lists/PaginateHelper$7$2;-><init>(Lcom/vk/lists/PaginateHelper$7;)V

    .line 345
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnComplete(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/lists/PaginateHelper$7$1;

    invoke-direct {v1, p0}, Lcom/vk/lists/PaginateHelper$7$1;-><init>(Lcom/vk/lists/PaginateHelper$7;)V

    .line 353
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnDispose(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method
