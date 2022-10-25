.class final synthetic Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

.field private final arg$2:Landroid/app/ProgressDialog;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;->arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;->arg$2:Landroid/app/ProgressDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;->arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;->arg$2:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->lambda$waitAndSendComment$9(Landroid/app/ProgressDialog;)V

    return-void
.end method
