.class final synthetic Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SettingsDebugFragment;

.field private final arg$2:Landroid/content/Context;

.field private final arg$3:Landroid/app/ProgressDialog;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;Landroid/content/Context;Landroid/app/ProgressDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->arg$1:Lcom/vkontakte/android/fragments/SettingsDebugFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->arg$2:Landroid/content/Context;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->arg$3:Landroid/app/ProgressDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;Landroid/content/Context;Landroid/app/ProgressDialog;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;-><init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;Landroid/content/Context;Landroid/app/ProgressDialog;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->arg$1:Lcom/vkontakte/android/fragments/SettingsDebugFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->arg$2:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->arg$3:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->lambda$downloadMessages$19(Landroid/content/Context;Landroid/app/ProgressDialog;)V

    return-void
.end method
