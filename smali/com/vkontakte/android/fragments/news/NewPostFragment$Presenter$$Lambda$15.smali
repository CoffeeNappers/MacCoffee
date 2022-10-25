.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private final arg$1:Landroid/app/AlertDialog;

.field private final arg$2:[Z


# direct methods
.method private constructor <init>(Landroid/app/AlertDialog;[Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;->arg$1:Landroid/app/AlertDialog;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;->arg$2:[Z

    return-void
.end method

.method public static lambdaFactory$(Landroid/app/AlertDialog;[Z)Landroid/view/View$OnTouchListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;-><init>(Landroid/app/AlertDialog;[Z)V

    return-object v0
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;->arg$1:Landroid/app/AlertDialog;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;->arg$2:[Z

    invoke-static {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$showOptions$15(Landroid/app/AlertDialog;[ZLandroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
