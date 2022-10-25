.class Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "SDKAuthActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SDKAuthActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChromeClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SDKAuthActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/SDKAuthActivity;)V
    .locals 0

    .prologue
    .line 150
    iput-object p1, p0, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/SDKAuthActivity;Lcom/vkontakte/android/SDKAuthActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/SDKAuthActivity;
    .param p2, "x1"    # Lcom/vkontakte/android/SDKAuthActivity$1;

    .prologue
    .line 150
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;-><init>(Lcom/vkontakte/android/SDKAuthActivity;)V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "progr"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 152
    const/16 v4, 0x64

    if-ge p2, v4, :cond_1

    move v0, v1

    .line 153
    .local v0, "visible":Z
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v4}, Lcom/vkontakte/android/SDKAuthActivity;->access$200(Lcom/vkontakte/android/SDKAuthActivity;)Landroid/widget/ProgressBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2

    :goto_1
    if-eq v0, v1, :cond_0

    .line 154
    if-eqz v0, :cond_3

    .line 156
    iget-object v1, p0, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v1}, Lcom/vkontakte/android/SDKAuthActivity;->access$200(Lcom/vkontakte/android/SDKAuthActivity;)Landroid/widget/ProgressBar;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 162
    :cond_0
    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v1}, Lcom/vkontakte/android/SDKAuthActivity;->access$400(Lcom/vkontakte/android/SDKAuthActivity;)Landroid/webkit/WebView;

    move-result-object v1

    if-nez v0, :cond_4

    iget-object v4, p0, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v4}, Lcom/vkontakte/android/SDKAuthActivity;->access$300(Lcom/vkontakte/android/SDKAuthActivity;)Lcom/vkontakte/android/ui/ErrorView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/ErrorView;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_4

    :goto_3
    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 163
    return-void

    .end local v0    # "visible":Z
    :cond_1
    move v0, v2

    .line 152
    goto :goto_0

    .restart local v0    # "visible":Z
    :cond_2
    move v1, v2

    .line 153
    goto :goto_1

    .line 159
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/SDKAuthActivity$ChromeClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v1}, Lcom/vkontakte/android/SDKAuthActivity;->access$200(Lcom/vkontakte/android/SDKAuthActivity;)Landroid/widget/ProgressBar;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_2

    :cond_4
    move v2, v3

    .line 162
    goto :goto_3
.end method
