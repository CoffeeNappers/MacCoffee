.class Lcom/vkontakte/android/ui/widget/WidgetListItemView$2;
.super Ljava/lang/Object;
.source "WidgetListItemView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/WidgetListItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/WidgetListItemView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/WidgetListItemView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/WidgetListItemView;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView$2;->this$0:Lcom/vkontakte/android/ui/widget/WidgetListItemView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 68
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView$2;->this$0:Lcom/vkontakte/android/ui/widget/WidgetListItemView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->access$000(Lcom/vkontakte/android/ui/widget/WidgetListItemView;)Lcom/vkontakte/android/api/widget/WidgetList$Item;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getTitleUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView$2;->this$0:Lcom/vkontakte/android/ui/widget/WidgetListItemView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->access$000(Lcom/vkontakte/android/ui/widget/WidgetListItemView;)Lcom/vkontakte/android/api/widget/WidgetList$Item;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getTitleTarget()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void
.end method
