.class Lcom/vkontakte/android/fragments/VKAlertBannerFragment$1;
.super Ljava/lang/Object;
.source "VKAlertBannerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->init(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/VKAlertBannerFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/VKAlertBannerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/VKAlertBannerFragment;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment$1;->this$0:Lcom/vkontakte/android/fragments/VKAlertBannerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment$1;->this$0:Lcom/vkontakte/android/fragments/VKAlertBannerFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->action()V

    .line 39
    return-void
.end method
