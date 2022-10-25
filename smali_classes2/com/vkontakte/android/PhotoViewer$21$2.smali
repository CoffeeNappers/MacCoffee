.class Lcom/vkontakte/android/PhotoViewer$21$2;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer$21;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/PhotoViewer$21;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer$21;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/PhotoViewer$21;

    .prologue
    .line 998
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$21$2;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1000
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21$2;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    iget-object v0, v0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$21$2;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    iget-object v1, v1, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget v1, v1, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 1001
    return-void
.end method
