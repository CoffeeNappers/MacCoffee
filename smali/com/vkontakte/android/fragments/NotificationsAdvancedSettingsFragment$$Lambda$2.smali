.class final synthetic Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;)V

    return-object v0
.end method


# virtual methods
.method public onPreferenceChange(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;->lambda$onCreate$1(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
