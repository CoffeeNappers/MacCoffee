.class Lcom/vkontakte/android/PhotoViewer$10$1;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/PhotoViewer$10;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer$10;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/PhotoViewer$10;

    .prologue
    .line 632
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$10$1;->this$1:Lcom/vkontakte/android/PhotoViewer$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 635
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$10$1;->this$1:Lcom/vkontakte/android/PhotoViewer$10;

    iget-object v0, v0, Lcom/vkontakte/android/PhotoViewer$10;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10$1;->this$1:Lcom/vkontakte/android/PhotoViewer$10;

    iget-object v1, v1, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    if-eq v0, v1, :cond_0

    .line 639
    :goto_0
    return-void

    .line 638
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$10$1;->this$1:Lcom/vkontakte/android/PhotoViewer$10;

    iget-object v0, v0, Lcom/vkontakte/android/PhotoViewer$10;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1600(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10$1;->this$1:Lcom/vkontakte/android/PhotoViewer$10;

    iget-object v1, v1, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v1, v1, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
