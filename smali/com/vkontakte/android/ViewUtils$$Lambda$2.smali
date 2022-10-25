.class final synthetic Lcom/vkontakte/android/ViewUtils$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/support/v7/widget/PopupMenu;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/PopupMenu;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ViewUtils$$Lambda$2;->arg$1:Landroid/support/v7/widget/PopupMenu;

    return-void
.end method

.method public static lambdaFactory$(Landroid/support/v7/widget/PopupMenu;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ViewUtils$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ViewUtils$$Lambda$2;-><init>(Landroid/support/v7/widget/PopupMenu;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$$Lambda$2;->arg$1:Landroid/support/v7/widget/PopupMenu;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->lambda$dismissDialogSafety$1(Landroid/support/v7/widget/PopupMenu;)V

    return-void
.end method
