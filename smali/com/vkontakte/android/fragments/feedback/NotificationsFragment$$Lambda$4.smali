.class final synthetic Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# instance fields
.field private final arg$1:[Z


# direct methods
.method private constructor <init>([Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$4;->arg$1:[Z

    return-void
.end method

.method public static lambdaFactory$([Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$4;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$4;-><init>([Z)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$4;->arg$1:[Z

    invoke-static {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->lambda$showFilterDialog$3([ZLandroid/content/DialogInterface;IZ)V

    return-void
.end method
