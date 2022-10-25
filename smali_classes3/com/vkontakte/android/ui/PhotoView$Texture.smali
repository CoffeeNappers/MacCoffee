.class Lcom/vkontakte/android/ui/PhotoView$Texture;
.super Ljava/lang/Object;
.source "PhotoView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/PhotoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Texture"
.end annotation


# instance fields
.field cropHeight:I

.field cropWidth:I

.field data:Landroid/graphics/Bitmap;

.field id:I

.field loaded:Z

.field photoIndex:I

.field final synthetic this$0:Lcom/vkontakte/android/ui/PhotoView;

.field thumb:Z


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/PhotoView;I)V
    .locals 1
    .param p2, "_id"    # I

    .prologue
    const/4 v0, 0x0

    .line 1502
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$Texture;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1498
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    .line 1499
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    .line 1503
    iput p2, p0, Lcom/vkontakte/android/ui/PhotoView$Texture;->id:I

    .line 1504
    return-void
.end method
