.class final synthetic Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$19;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$19;->arg$1:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$19;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$19;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$19;->arg$1:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->lambda$null$13(Landroid/content/Context;)V

    return-void
.end method
