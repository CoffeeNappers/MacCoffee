.class final synthetic Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)V

    return-object v0
.end method


# virtual methods
.method public onPreferenceClick(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->lambda$onCreate$1(Landroid/support/v7/preference/Preference;)Z

    move-result v0

    return v0
.end method
