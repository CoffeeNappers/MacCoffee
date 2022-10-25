.class Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FadeRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;

.field private final toHide:Landroid/view/View;

.field private final toShow:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .param p2, "toShow"    # Landroid/view/View;
    .param p3, "toHide"    # Landroid/view/View;

    .prologue
    .line 1114
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1115
    iput-object p2, p0, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;->toShow:Landroid/view/View;

    .line 1116
    iput-object p3, p0, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;->toHide:Landroid/view/View;

    .line 1117
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1121
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;->toShow:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1122
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;->toHide:Landroid/view/View;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1123
    return-void
.end method
