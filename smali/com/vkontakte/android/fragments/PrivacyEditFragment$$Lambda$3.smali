.class final synthetic Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF0;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/PrivacyEditFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)Lcom/vkontakte/android/functions/VoidF0;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$3;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->lambda$beforeSetAdapter$2()V

    return-void
.end method
