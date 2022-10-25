.class Lcom/vk/masks/MasksView$1;
.super Ljava/lang/Object;
.source "MasksView.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksView;->reload(Lcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;
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
        "Lcom/vkontakte/android/api/masks/MasksResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksView;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/vk/masks/MasksView$1;->this$0:Lcom/vk/masks/MasksView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/api/masks/MasksResponse;)V
    .locals 1
    .param p1, "masks"    # Lcom/vkontakte/android/api/masks/MasksResponse;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/masks/MasksView$1;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v0}, Lcom/vk/masks/MasksView;->access$000(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksAdapter;->clear()V

    .line 100
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 96
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksView$1;->accept(Lcom/vkontakte/android/api/masks/MasksResponse;)V

    return-void
.end method
