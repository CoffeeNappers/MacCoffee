.class Lcom/vkontakte/android/PhotoViewer$18$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer$18;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/PhotoViewer$18;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer$18;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/PhotoViewer$18;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 910
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$18$1;->this$1:Lcom/vkontakte/android/PhotoViewer$18;

    iput-object p3, p0, Lcom/vkontakte/android/PhotoViewer$18$1;->val$text:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 913
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$18$1;->this$1:Lcom/vkontakte/android/PhotoViewer$18;

    iget-object v0, v0, Lcom/vkontakte/android/PhotoViewer$18;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$18$1;->val$text:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    .line 914
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$18$1;->this$1:Lcom/vkontakte/android/PhotoViewer$18;

    iget-object v0, v0, Lcom/vkontakte/android/PhotoViewer$18;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$18$1;->this$1:Lcom/vkontakte/android/PhotoViewer$18;

    iget-object v1, v1, Lcom/vkontakte/android/PhotoViewer$18;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget v1, v1, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 915
    return-void
.end method
