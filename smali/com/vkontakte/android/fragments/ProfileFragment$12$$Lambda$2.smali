.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$12;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$12;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$12;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$12;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$12;)V

    return-object v0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$12;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$12;->lambda$success$1(Landroid/content/DialogInterface;)V

    return-void
.end method
