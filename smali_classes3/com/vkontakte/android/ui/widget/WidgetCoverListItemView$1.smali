.class Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$1;
.super Ljava/lang/Object;
.source "WidgetCoverListItemView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$1;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$1;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$000(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->getButtonUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$1;->this$0:Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->access$000(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->getButtonTarget()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    return-void
.end method
