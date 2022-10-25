.class Lcom/vkontakte/android/PhotoViewer$22;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->showTags()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/PhotoTag;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1045
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$22;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1045
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/PhotoViewer$22;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/PhotoTag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1048
    .local p1, "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/PhotoTag;>;"
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$22;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v0

    iput-object p1, v0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    .line 1049
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$22;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$3000(Lcom/vkontakte/android/PhotoViewer;)V

    .line 1050
    return-void
.end method
