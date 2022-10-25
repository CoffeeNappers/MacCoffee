.class Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;
.super Ljava/lang/Object;
.source "WidgetCoverListItemView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 3

    .prologue
    .line 69
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$100(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getWidth()I

    move-result v0

    .line 70
    .local v0, "width":I
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$200(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-static {v1, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$202(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;I)I

    .line 72
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$200(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$300(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;I)V

    .line 74
    :cond_0
    const/4 v1, 0x1

    return v1
.end method
