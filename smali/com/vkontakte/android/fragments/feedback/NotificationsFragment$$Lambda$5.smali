.class final synthetic Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

.field private final arg$2:[Z

.field private final arg$3:[Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;[Z[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->arg$1:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->arg$2:[Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->arg$3:[Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;[Z[Ljava/lang/String;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;-><init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;[Z[Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->arg$1:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->arg$2:[Z

    iget-object v2, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->arg$3:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->lambda$showFilterDialog$4([Z[Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
