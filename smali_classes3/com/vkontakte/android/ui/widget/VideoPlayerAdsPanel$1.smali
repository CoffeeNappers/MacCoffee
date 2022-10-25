.class Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel$1;
.super Ljava/lang/Object;
.source "VideoPlayerAdsPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->initView(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel$1;->this$0:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 78
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 79
    .local v1, "context":Landroid/content/Context;
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel$1;->this$0:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->access$000(Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 80
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel$1;->this$0:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->access$000(Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/AdsUtil;->onAdsPostClick(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 82
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 83
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_1

    .line 84
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 86
    :cond_1
    return-void
.end method
