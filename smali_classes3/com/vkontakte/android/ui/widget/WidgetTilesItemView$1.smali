.class Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$1;
.super Ljava/lang/Object;
.source "WidgetTilesItemView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$1;->this$0:Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$1;->this$0:Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->access$000(Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;)Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;->getButtonUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$1;->this$0:Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->access$000(Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;)Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;->getButtonTarget()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    return-void
.end method
