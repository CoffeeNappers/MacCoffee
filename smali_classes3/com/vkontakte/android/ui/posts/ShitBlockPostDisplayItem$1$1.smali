.class Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;
.super Ljava/lang/Object;
.source "ShitBlockPostDisplayItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;->onLayoutChange(Landroid/view/View;IIIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;

.field final synthetic val$item:Landroid/view/View;

.field final synthetic val$left:I

.field final synthetic val$right:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;Landroid/view/View;II)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->val$item:Landroid/view/View;

    iput p3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->val$right:I

    iput p4, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->val$left:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->val$item:Landroid/view/View;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->val$right:I

    iget v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;->val$left:I

    sub-int/2addr v2, v3

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    return-void
.end method
