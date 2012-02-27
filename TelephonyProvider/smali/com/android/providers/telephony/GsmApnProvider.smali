.class public Lcom/android/providers/telephony/GsmApnProvider;
.super Landroid/content/ContentProvider;
.source "GsmApnProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;,
        Lcom/android/providers/telephony/GsmApnProvider$MSGFORAWRD;
    }
.end annotation


# static fields
.field private static final APN_CUSTOMIZE_FILENAME:Ljava/lang/String; = "apns.xml"

.field private static final APN_CUSTOMIZE_PATH:Ljava/lang/String; = "/system/etc/customer"

.field private static final CARRIERS_TABLE:Ljava/lang/String; = "carriers"

.field private static final COLUMN_APN_ID:Ljava/lang/String; = "apn_id"

.field private static final COLUMN_DUN_ID:Ljava/lang/String; = "dun_id"

.field private static final COLUMN_INSERT_BY_EXTERNEL:Ljava/lang/String; = "external"

.field private static final COLUMN_INSERT_BY_INTERNEL:Ljava/lang/String; = "internal"

.field private static final DATABASE_NAME:Ljava/lang/String; = "telephony.db"

.field private static final DATABASE_VERSION:I = 0xd0000

.field private static DBG:Z = false

.field private static final PARTNER_APNS_PATH:Ljava/lang/String; = "etc/apns-conf.xml"

.field private static final PREF_FILE:Ljava/lang/String; = "preferred-apn"

.field private static final PREF_FILE_DUN:Ljava/lang/String; = "preferred-dun"

.field private static final TAG:Ljava/lang/String; = "GsmApnProvider"

.field private static final URL_CURRENT:I = 0x2

.field private static final URL_ID:I = 0x3

.field private static final URL_IDENTICAL:I = 0x8

.field private static final URL_MSGFORWARD:I = 0x6

.field private static final URL_PREFERAPN:I = 0x5

.field private static final URL_PREFERDUN:I = 0x7

.field private static final URL_RESTOREAPN:I = 0x4

.field private static final URL_TELEPHONY:I = 0x1

.field private static final mApnDispatchMode:Z

.field private static mCustomizeApns:Z

.field private static final s_currentNullMap:Landroid/content/ContentValues;

.field private static final s_currentSetMap:Landroid/content/ContentValues;

.field private static final s_urlMatcher:Landroid/content/UriMatcher;


# instance fields
.field private mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 97
    sput-boolean v4, Lcom/android/providers/telephony/GsmApnProvider;->DBG:Z

    .line 117
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    .line 121
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/providers/telephony/GsmApnProvider;->mCustomizeApns:Z

    .line 123
    sget-boolean v0, Landroid/provider/Telephony$Carriers;->FLAG_APN_DISPATCH_MODE:Z

    sput-boolean v0, Lcom/android/providers/telephony/GsmApnProvider;->mApnDispatchMode:Z

    .line 126
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers"

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 127
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers/current"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 128
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers/#"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 129
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers/restore"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 130
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers/preferapn"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 131
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "msgforward"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 133
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers/preferdun"

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 136
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    const-string v1, "gsmapn"

    const-string v2, "carriers/identical"

    const/16 v3, 0x8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 139
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, v4}, Landroid/content/ContentValues;-><init>(I)V

    sput-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_currentNullMap:Landroid/content/ContentValues;

    .line 140
    sget-object v1, Lcom/android/providers/telephony/GsmApnProvider;->s_currentNullMap:Landroid/content/ContentValues;

    const-string v2, "current"

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 142
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, v4}, Landroid/content/ContentValues;-><init>(I)V

    sput-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_currentSetMap:Landroid/content/ContentValues;

    .line 143
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_currentSetMap:Landroid/content/ContentValues;

    const-string v1, "current"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 174
    return-void
.end method

.method private static Log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 1248
    sget-boolean v0, Lcom/android/providers/telephony/GsmApnProvider;->DBG:Z

    if-eqz v0, :cond_0

    .line 1249
    const-string v0, "GsmApnProvider"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1251
    :cond_0
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 75
    sget-boolean v0, Lcom/android/providers/telephony/GsmApnProvider;->mCustomizeApns:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 75
    sput-boolean p0, Lcom/android/providers/telephony/GsmApnProvider;->mCustomizeApns:Z

    return p0
.end method

.method static synthetic access$100(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 75
    invoke-static {p0}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    return-void
.end method

.method private checkPermission()V
    .locals 3

    .prologue
    .line 1099
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.WRITE_APN_SETTINGS"

    const-string v2, "No permission to write APN settings"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1101
    return-void
.end method

.method private getIMSI()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1149
    const/4 v0, 0x0

    .line 1150
    .local v0, imsi:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 1152
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    if-eqz v1, :cond_0

    .line 1153
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 1155
    :cond_0
    return-object v0
.end method

.method private getPreferredApnId()J
    .locals 4

    .prologue
    .line 647
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "preferred-apn"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 648
    .local v0, sp:Landroid/content/SharedPreferences;
    const-string v1, "apn_id"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    return-wide v1
.end method

.method private getPreferredDunId()J
    .locals 4

    .prologue
    .line 643
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "preferred-dun"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 644
    .local v0, sp:Landroid/content/SharedPreferences;
    const-string v1, "dun_id"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    return-wide v1
.end method

.method private handleAustraliaIdenticalNumeric(Ljava/lang/String;Ljava/lang/String;)V
    .locals 16
    .parameter "imsi"
    .parameter "numeric"

    .prologue
    .line 1210
    const-string v3, "50502"

    .line 1211
    .local v3, AUSTRALIA_NUMERIC:Ljava/lang/String;
    const/4 v6, 0x6

    .line 1213
    .local v6, IDENTIFIER_LENGTH:I
    const-string v14, "50502"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 1214
    const-string v1, "505"

    .line 1215
    .local v1, AUSTRALIA_MCC:Ljava/lang/String;
    const-string v2, "02"

    .line 1216
    .local v2, AUSTRALIA_MNC:Ljava/lang/String;
    const-string v4, "*"

    .line 1217
    .local v4, AUSTRALIA_SYMBOL:Ljava/lang/String;
    const-string v5, "505029"

    .line 1219
    .local v5, AUSTRALIA_VM:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    .line 1221
    .local v8, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v12, "numeric = \'50502\' AND insert_by is not null AND operator is null"

    .line 1222
    .local v12, starWhere:Ljava/lang/String;
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 1223
    .local v11, starValues:Landroid/content/ContentValues;
    const-string v14, "numeric"

    const-string v15, "*50502"

    invoke-virtual {v11, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1224
    const-string v14, "mcc"

    const-string v15, "*505"

    invoke-virtual {v11, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1225
    const-string v14, "mnc"

    const-string v15, "*02"

    invoke-virtual {v11, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1226
    const-string v14, "carriers"

    const/4 v15, 0x0

    invoke-virtual {v8, v14, v11, v12, v15}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    .line 1227
    .local v7, count:I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "handleAustraliaIdenticalNumeric, star symbol update = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1229
    const/4 v14, 0x0

    const/4 v15, 0x6

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 1230
    .local v9, identifier:Ljava/lang/String;
    const-string v10, ""

    .line 1231
    .local v10, identifierWhere:Ljava/lang/String;
    const-string v14, "505029"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 1232
    const-string v10, "numeric = \'*50502\' AND identifier = \'505029\'"

    .line 1236
    :goto_0
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 1237
    .local v13, values:Landroid/content/ContentValues;
    const-string v14, "numeric"

    const-string v15, "50502"

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1238
    const-string v14, "mcc"

    const-string v15, "505"

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1239
    const-string v14, "mnc"

    const-string v15, "02"

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1240
    const-string v14, "carriers"

    const/4 v15, 0x0

    invoke-virtual {v8, v14, v13, v10, v15}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    .line 1241
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "handleAustraliaIdenticalNumeric, identifier update = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1243
    .end local v1           #AUSTRALIA_MCC:Ljava/lang/String;
    .end local v2           #AUSTRALIA_MNC:Ljava/lang/String;
    .end local v4           #AUSTRALIA_SYMBOL:Ljava/lang/String;
    .end local v5           #AUSTRALIA_VM:Ljava/lang/String;
    .end local v7           #count:I
    .end local v8           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v9           #identifier:Ljava/lang/String;
    .end local v10           #identifierWhere:Ljava/lang/String;
    .end local v11           #starValues:Landroid/content/ContentValues;
    .end local v12           #starWhere:Ljava/lang/String;
    .end local v13           #values:Landroid/content/ContentValues;
    :cond_0
    return-void

    .line 1234
    .restart local v1       #AUSTRALIA_MCC:Ljava/lang/String;
    .restart local v2       #AUSTRALIA_MNC:Ljava/lang/String;
    .restart local v4       #AUSTRALIA_SYMBOL:Ljava/lang/String;
    .restart local v5       #AUSTRALIA_VM:Ljava/lang/String;
    .restart local v7       #count:I
    .restart local v8       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v9       #identifier:Ljava/lang/String;
    .restart local v10       #identifierWhere:Ljava/lang/String;
    .restart local v11       #starValues:Landroid/content/ContentValues;
    .restart local v12       #starWhere:Ljava/lang/String;
    :cond_1
    const-string v10, "numeric = \'*50502\' AND identifier is null"

    goto :goto_0
.end method

.method private handleIdenticalNumeric()V
    .locals 4

    .prologue
    .line 1159
    invoke-direct {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getIMSI()Ljava/lang/String;

    move-result-object v0

    .line 1160
    .local v0, imsi:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleIdenticalNumeric, imsi = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1161
    if-nez v0, :cond_0

    .line 1168
    :goto_0
    return-void

    .line 1164
    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x5

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1166
    .local v1, numeric:Ljava/lang/String;
    invoke-direct {p0, v0, v1}, Lcom/android/providers/telephony/GsmApnProvider;->handleThailandIdenticalNumeric(Ljava/lang/String;Ljava/lang/String;)V

    .line 1167
    invoke-direct {p0, v0, v1}, Lcom/android/providers/telephony/GsmApnProvider;->handleAustraliaIdenticalNumeric(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private handleThailandIdenticalNumeric(Ljava/lang/String;Ljava/lang/String;)V
    .locals 19
    .parameter "imsi"
    .parameter "numeric"

    .prologue
    .line 1171
    const-string v7, "52000"

    .line 1172
    .local v7, THAILAND_NUMERIC:Ljava/lang/String;
    const/4 v3, 0x7

    .line 1174
    .local v3, IDENTIFIER_LENGTH:I
    const-string v17, "52000"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_0

    .line 1175
    const-string v5, "520"

    .line 1176
    .local v5, THAILAND_MCC:Ljava/lang/String;
    const-string v6, "00"

    .line 1177
    .local v6, THAILAND_MNC:Ljava/lang/String;
    const-string v8, "*"

    .line 1178
    .local v8, THAILAND_SYMBOL:Ljava/lang/String;
    const-string v4, "5200019"

    .line 1179
    .local v4, THAILAND_CAT_3G:Ljava/lang/String;
    const-string v9, "5200020"

    .line 1181
    .local v9, THAILAND_TRUE_MOVE_H:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v11

    .line 1183
    .local v11, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v15, "numeric = \'52000\' AND insert_by is not null AND operator is null"

    .line 1184
    .local v15, starWhere:Ljava/lang/String;
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 1185
    .local v14, starValues:Landroid/content/ContentValues;
    const-string v17, "numeric"

    const-string v18, "*52000"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1186
    const-string v17, "mcc"

    const-string v18, "*520"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1187
    const-string v17, "mnc"

    const-string v18, "*00"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1188
    const-string v17, "carriers"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v11, v0, v14, v15, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 1189
    .local v10, count:I
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "handleThailandIdenticalNumeric, star symbol update = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1191
    const/16 v17, 0x0

    const/16 v18, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 1192
    .local v12, identifier:Ljava/lang/String;
    const-string v13, ""

    .line 1193
    .local v13, identifierWhere:Ljava/lang/String;
    const-string v17, "5200019"

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 1194
    const-string v13, "numeric = \'*52000\' AND identifier = \'5200019\'"

    .line 1200
    :goto_0
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 1201
    .local v16, values:Landroid/content/ContentValues;
    const-string v17, "numeric"

    const-string v18, "52000"

    invoke-virtual/range {v16 .. v18}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1202
    const-string v17, "mcc"

    const-string v18, "520"

    invoke-virtual/range {v16 .. v18}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1203
    const-string v17, "mnc"

    const-string v18, "00"

    invoke-virtual/range {v16 .. v18}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1204
    const-string v17, "carriers"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v11, v0, v1, v13, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 1205
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "handleThailandIdenticalNumeric, identifier update = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1207
    .end local v4           #THAILAND_CAT_3G:Ljava/lang/String;
    .end local v5           #THAILAND_MCC:Ljava/lang/String;
    .end local v6           #THAILAND_MNC:Ljava/lang/String;
    .end local v8           #THAILAND_SYMBOL:Ljava/lang/String;
    .end local v9           #THAILAND_TRUE_MOVE_H:Ljava/lang/String;
    .end local v10           #count:I
    .end local v11           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v12           #identifier:Ljava/lang/String;
    .end local v13           #identifierWhere:Ljava/lang/String;
    .end local v14           #starValues:Landroid/content/ContentValues;
    .end local v15           #starWhere:Ljava/lang/String;
    .end local v16           #values:Landroid/content/ContentValues;
    :cond_0
    return-void

    .line 1195
    .restart local v4       #THAILAND_CAT_3G:Ljava/lang/String;
    .restart local v5       #THAILAND_MCC:Ljava/lang/String;
    .restart local v6       #THAILAND_MNC:Ljava/lang/String;
    .restart local v8       #THAILAND_SYMBOL:Ljava/lang/String;
    .restart local v9       #THAILAND_TRUE_MOVE_H:Ljava/lang/String;
    .restart local v10       #count:I
    .restart local v11       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v12       #identifier:Ljava/lang/String;
    .restart local v13       #identifierWhere:Ljava/lang/String;
    .restart local v14       #starValues:Landroid/content/ContentValues;
    .restart local v15       #starWhere:Ljava/lang/String;
    :cond_1
    const-string v17, "5200020"

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 1196
    const-string v13, "numeric = \'*52000\' AND identifier = \'5200020\'"

    goto :goto_0

    .line 1198
    :cond_2
    const-string v13, "numeric = \'*52000\' AND identifier is null"

    goto :goto_0
.end method

.method private isExistingDefaultApn(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 9
    .parameter "url"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1104
    new-instance v7, Ljava/lang/StringBuffer;

    const-string v0, "insert_by=? OR insert_by=?"

    invoke-direct {v7, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1105
    .local v7, newWhere:Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 1107
    .local v4, newArgs:[Ljava/lang/String;
    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    .line 1108
    const-string v0, " AND ("

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1109
    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1110
    const-string v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1111
    array-length v0, p3

    add-int/lit8 v0, v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    .line 1112
    array-length v0, p3

    invoke-static {p3, v1, v4, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1117
    :goto_0
    const-string v0, "internal"

    aput-object v0, v4, v1

    .line 1118
    const-string v0, "external"

    aput-object v0, v4, v2

    .line 1120
    const/4 v8, 0x0

    .line 1121
    .local v8, result:Z
    new-array v2, v2, [Ljava/lang/String;

    const-string v0, "insert_by"

    aput-object v0, v2, v1

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "name ASC"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/providers/telephony/GsmApnProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1122
    .local v6, mCursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1123
    const/4 v8, 0x1

    .line 1124
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1127
    :cond_0
    return v8

    .line 1114
    .end local v6           #mCursor:Landroid/database/Cursor;
    .end local v8           #result:Z
    :cond_1
    new-array v4, v3, [Ljava/lang/String;

    goto :goto_0
.end method

.method private restoreDefaultAPN()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1133
    iget-object v1, p0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1135
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "carriers"

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1136
    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredApnId(Ljava/lang/Long;)V

    .line 1137
    iget-object v1, p0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    check-cast v1, Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;

    #calls: Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;->initDatabase(Landroid/database/sqlite/SQLiteDatabase;)V
    invoke-static {v1, v0}, Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;->access$200(Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1140
    invoke-direct {p0}, Lcom/android/providers/telephony/GsmApnProvider;->handleIdenticalNumeric()V

    .line 1142
    return-void
.end method

.method private setPreferredApnId(Ljava/lang/Long;)V
    .locals 5
    .parameter "id"

    .prologue
    .line 626
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "preferred-apn"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 627
    .local v1, sp:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 628
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v4, "apn_id"

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    :goto_0
    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 629
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 630
    return-void

    .line 628
    :cond_0
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method private setPreferredDunId(Ljava/lang/Long;)V
    .locals 5
    .parameter "id"

    .prologue
    .line 634
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "preferred-dun"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 636
    .local v1, sp:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 637
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v4, "dun_id"

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    :goto_0
    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 638
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 639
    return-void

    .line 637
    :cond_0
    const-wide/16 v2, -0x1

    goto :goto_0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 10
    .parameter "url"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    .line 919
    const/4 v1, 0x0

    .line 920
    .local v1, count:I
    const/4 v0, 0x1

    .line 922
    .local v0, actionAllowed:Z
    invoke-direct {p0}, Lcom/android/providers/telephony/GsmApnProvider;->checkPermission()V

    .line 924
    sget-short v5, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_DEVICE_flag:S

    const/16 v6, 0x90

    if-ne v5, v6, :cond_0

    sget-short v5, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/16 v6, 0xa9

    if-ne v5, v6, :cond_0

    .line 926
    invoke-direct {p0, p1, p2, p3}, Lcom/android/providers/telephony/GsmApnProvider;->isExistingDefaultApn(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v0, 0x1

    .line 929
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 930
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v5, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v5, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    .line 932
    .local v3, match:I
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v4

    .line 934
    .local v4, pid:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pid="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", delete match="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " actionAllowed="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", where=\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 936
    packed-switch v3, :pswitch_data_0

    .line 986
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cannot delete that URL: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 926
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v3           #match:I
    .end local v4           #pid:I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 940
    .restart local v2       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v3       #match:I
    .restart local v4       #pid:I
    :pswitch_0
    if-eqz v0, :cond_2

    .line 941
    const-string v5, "carriers"

    invoke-virtual {v2, v5, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 990
    :cond_2
    :goto_1
    if-lez v1, :cond_3

    .line 991
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pid="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", telephony delete count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 992
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 993
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/Telephony$GsmCarriers;->CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    :goto_2
    move v5, v1

    .line 998
    :goto_3
    return v5

    .line 948
    :pswitch_1
    if-eqz v0, :cond_2

    .line 949
    const-string v5, "carriers"

    invoke-virtual {v2, v5, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_1

    .line 956
    :pswitch_2
    if-eqz v0, :cond_2

    .line 957
    const-string v5, "carriers"

    const-string v6, "_id=?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v2, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_1

    .line 964
    :pswitch_3
    const/4 v1, 0x1

    .line 965
    invoke-direct {p0}, Lcom/android/providers/telephony/GsmApnProvider;->restoreDefaultAPN()V

    goto :goto_1

    .line 971
    :pswitch_4
    const-wide/16 v5, -0x1

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredApnId(Ljava/lang/Long;)V

    .line 972
    const/4 v1, 0x1

    .line 973
    goto :goto_1

    .line 978
    :pswitch_5
    const-wide/16 v5, -0x1

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredDunId(Ljava/lang/Long;)V

    .line 979
    const/4 v1, 0x1

    .line 980
    goto :goto_1

    .line 984
    :pswitch_6
    const/4 v5, 0x0

    goto :goto_3

    .line 995
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pid="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", telephony delete fail count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    goto :goto_2

    .line 936
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "url"

    .prologue
    .line 737
    sget-object v0, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 751
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URL "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 739
    :pswitch_1
    const-string v0, "vnd.android.cursor.dir/gsm-telephony-carrier"

    .line 748
    :goto_0
    return-object v0

    .line 742
    :pswitch_2
    const-string v0, "vnd.android.cursor.item/gsm-telephony-carrier"

    goto :goto_0

    .line 745
    :pswitch_3
    const-string v0, "vnd.android.cursor.item/gsm-telephony-carrier"

    goto :goto_0

    .line 748
    :pswitch_4
    const-string v0, "vnd.android.cursor.item/gsm-telephony-carrier"

    goto :goto_0

    .line 737
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 18
    .parameter "url"
    .parameter "initialValues"

    .prologue
    .line 758
    const/4 v8, 0x0

    .line 760
    .local v8, result:Landroid/net/Uri;
    invoke-direct/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->checkPermission()V

    .line 762
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 763
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v14, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v4

    .line 764
    .local v4, match:I
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v7

    .line 766
    .local v7, pid:I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "pid="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", insert match="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", values=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p2 .. p2}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 768
    const/4 v5, 0x0

    .line 769
    .local v5, notify:Z
    packed-switch v4, :pswitch_data_0

    .line 907
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v5, :cond_1

    .line 908
    invoke-virtual/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    sget-object v15, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const/16 v16, 0x0

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 909
    invoke-virtual/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    sget-object v15, Landroid/provider/Telephony$GsmCarriers;->CONTENT_URI:Landroid/net/Uri;

    const/16 v16, 0x0

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 910
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "pid="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", telephony insert end result="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    :cond_1
    move-object v9, v8

    .line 913
    .end local v8           #result:Landroid/net/Uri;
    .local v9, result:Landroid/net/Uri;
    :goto_1
    return-object v9

    .line 774
    .end local v9           #result:Landroid/net/Uri;
    .restart local v8       #result:Landroid/net/Uri;
    :pswitch_1
    if-eqz p2, :cond_13

    .line 775
    new-instance v13, Landroid/content/ContentValues;

    move-object/from16 v0, p2

    invoke-direct {v13, v0}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 782
    .local v13, values:Landroid/content/ContentValues;
    :goto_2
    const-string v14, "name"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 783
    const-string v14, "name"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    :cond_2
    const-string v14, "apn"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3

    .line 786
    const-string v14, "apn"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    :cond_3
    const-string v14, "port"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 789
    const-string v14, "port"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 791
    :cond_4
    const-string v14, "proxy"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_5

    .line 792
    const-string v14, "proxy"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 794
    :cond_5
    const-string v14, "mmsprotocol"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_6

    .line 795
    const-string v14, "mmsprotocol"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 797
    :cond_6
    const-string v14, "user"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 798
    const-string v14, "user"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 800
    :cond_7
    const-string v14, "server"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_8

    .line 801
    const-string v14, "server"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 803
    :cond_8
    const-string v14, "password"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_9

    .line 804
    const-string v14, "password"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 806
    :cond_9
    const-string v14, "mmsport"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_a

    .line 807
    const-string v14, "mmsport"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    :cond_a
    const-string v14, "mmsproxy"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_b

    .line 810
    const-string v14, "mmsproxy"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    :cond_b
    const-string v14, "authtype"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_c

    .line 813
    const-string v14, "authtype"

    const/4 v15, -0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 818
    :cond_c
    sget-short v14, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/16 v15, 0xd8

    if-eq v14, v15, :cond_e

    sget-short v14, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_DEVICE_flag:S

    const/16 v15, 0x9d

    if-ne v14, v15, :cond_d

    sget-short v14, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/4 v15, 0x1

    if-eq v14, v15, :cond_e

    :cond_d
    sget-short v14, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/4 v15, 0x7

    if-ne v14, v15, :cond_10

    .line 823
    :cond_e
    const-string v14, "databearer"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_f

    .line 824
    const-string v14, "databearer"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 826
    :cond_f
    const-string v14, "pppnumber"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_10

    .line 827
    const-string v14, "pppnumber"

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 830
    :cond_10
    const-string v14, "protocol"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_11

    .line 831
    const-string v14, "protocol"

    const-string v15, "IP"

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 833
    :cond_11
    const-string v14, "roaming_protocol"

    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_12

    .line 834
    const-string v14, "roaming_protocol"

    const-string v15, "IP"

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    :cond_12
    const-string v14, "carriers"

    const/4 v15, 0x0

    invoke-virtual {v3, v14, v15, v13}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v10

    .line 838
    .local v10, rowID:J
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-lez v14, :cond_14

    .line 841
    sget-object v14, Landroid/provider/Telephony$GsmCarriers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v14, v10, v11}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v8

    .line 843
    const/4 v5, 0x1

    .line 848
    :goto_3
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "inserted "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v13}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " rowID = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 777
    .end local v10           #rowID:J
    .end local v13           #values:Landroid/content/ContentValues;
    :cond_13
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .restart local v13       #values:Landroid/content/ContentValues;
    goto/16 :goto_2

    .line 845
    .restart local v10       #rowID:J
    :cond_14
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "insert failed pid="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", match="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", values="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v13}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    goto :goto_3

    .line 855
    .end local v10           #rowID:J
    .end local v13           #values:Landroid/content/ContentValues;
    :pswitch_2
    const-string v14, "carriers"

    sget-object v15, Lcom/android/providers/telephony/GsmApnProvider;->s_currentNullMap:Landroid/content/ContentValues;

    const-string v16, "current IS NOT NULL"

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v3, v14, v15, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 857
    const-string v14, "numeric"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 858
    .local v6, numeric:Ljava/lang/String;
    const-string v14, "carriers"

    sget-object v15, Lcom/android/providers/telephony/GsmApnProvider;->s_currentSetMap:Landroid/content/ContentValues;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "numeric = \'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v3, v14, v15, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v12

    .line 861
    .local v12, updated:I
    if-lez v12, :cond_15

    .line 864
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Setting numeric \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\' to be the current operator"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 875
    :cond_15
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Failed setting numeric \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\' to the current operator"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 883
    .end local v6           #numeric:Ljava/lang/String;
    .end local v12           #updated:I
    :pswitch_3
    if-eqz p2, :cond_0

    .line 884
    const-string v14, "apn_id"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 885
    const-string v14, "apn_id"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredApnId(Ljava/lang/Long;)V

    goto/16 :goto_0

    .line 893
    :pswitch_4
    if-eqz p2, :cond_0

    .line 894
    const-string v14, "dun_id"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 895
    const-string v14, "dun_id"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredDunId(Ljava/lang/Long;)V

    goto/16 :goto_0

    .line 902
    :pswitch_5
    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v14, v15}, Lcom/android/providers/telephony/GsmApnProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 903
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "pid="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", telephony insert result="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    move-object v9, v8

    .line 904
    .end local v8           #result:Landroid/net/Uri;
    .restart local v9       #result:Landroid/net/Uri;
    goto/16 :goto_1

    .line 769
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 620
    sget-boolean v0, Lcom/android/providers/telephony/GsmApnProvider;->mApnDispatchMode:Z

    if-eqz v0, :cond_0

    .line 621
    new-instance v0, Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/GsmApnProvider$DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 622
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 18
    .parameter "url"
    .parameter "projectionIn"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sort"

    .prologue
    .line 654
    new-instance v2, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v2}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 655
    .local v2, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v4, "carriers"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 656
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v15

    .line 658
    .local v15, pid:I
    sget-object v4, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v14

    .line 660
    .local v14, match:I
    packed-switch v14, :pswitch_data_0

    .line 717
    :pswitch_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", query match="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", selection=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 719
    const/4 v13, 0x0

    .line 731
    :goto_0
    return-object v13

    .line 667
    :pswitch_1
    const-string v4, "current IS NOT NULL"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 668
    const/16 p3, 0x0

    .line 723
    :goto_1
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 724
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 725
    .local v17, ret:Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-interface {v0, v4, v1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 727
    const/4 v12, -0x1

    .line 728
    .local v12, count:I
    if-eqz v17, :cond_0

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->getCount()I

    move-result v12

    .line 729
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", query match="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", selection=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", count="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    move-object/from16 v13, v17

    .line 731
    goto :goto_0

    .line 672
    .end local v3           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v12           #count:I
    .end local v17           #ret:Landroid/database/Cursor;
    :pswitch_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    const/4 v6, 0x1

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 676
    :pswitch_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->getPreferredApnId()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 682
    :pswitch_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->getPreferredDunId()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 687
    :pswitch_6
    const/4 v4, 0x4

    new-array v10, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "forward_phone_number"

    aput-object v5, v10, v4

    const/4 v4, 0x1

    const-string v5, "forward_phone_time_stamp"

    aput-object v5, v10, v4

    const/4 v4, 0x2

    const-string v5, "forward_emial_address"

    aput-object v5, v10, v4

    const/4 v4, 0x3

    const-string v5, "forward_email_time_stamp"

    aput-object v5, v10, v4

    .line 692
    .local v10, COLUMN_NAME:[Ljava/lang/String;
    new-instance v13, Landroid/database/MatrixCursor;

    invoke-direct {v13, v10}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 694
    .local v13, csrMatrix:Landroid/database/MatrixCursor;
    array-length v4, v10

    new-array v11, v4, [Ljava/lang/Object;

    .line 695
    .local v11, aobjRow:[Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "MSG_FORWARD_INFO"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 697
    .local v16, prefForward:Landroid/content/SharedPreferences;
    const/4 v4, 0x0

    const-string v5, "forward_phone_number"

    const-string v6, ""

    move-object/from16 v0, v16

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v11, v4

    .line 698
    const/4 v4, 0x1

    const-string v5, "forward_phone_time_stamp"

    const-wide/16 v6, 0x0

    move-object/from16 v0, v16

    invoke-interface {v0, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v11, v4

    .line 699
    const/4 v4, 0x2

    const-string v5, "forward_emial_address"

    const-string v6, ""

    move-object/from16 v0, v16

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v11, v4

    .line 700
    const/4 v4, 0x3

    const-string v5, "forward_email_time_stamp"

    const-wide/16 v6, 0x0

    move-object/from16 v0, v16

    invoke-interface {v0, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v11, v4

    .line 702
    invoke-virtual {v13, v11}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 704
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", query match="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", selection=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 711
    .end local v10           #COLUMN_NAME:[Ljava/lang/String;
    .end local v11           #aobjRow:[Ljava/lang/Object;
    .end local v13           #csrMatrix:Landroid/database/MatrixCursor;
    .end local v16           #prefForward:Landroid/content/SharedPreferences;
    :pswitch_7
    invoke-direct/range {p0 .. p0}, Lcom/android/providers/telephony/GsmApnProvider;->handleIdenticalNumeric()V

    .line 712
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 660
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_6
        :pswitch_5
        :pswitch_7
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 11
    .parameter "url"
    .parameter "values"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    .line 1004
    const/4 v1, 0x0

    .line 1005
    .local v1, count:I
    const/4 v0, 0x1

    .line 1007
    .local v0, actionAllowed:Z
    invoke-direct {p0}, Lcom/android/providers/telephony/GsmApnProvider;->checkPermission()V

    .line 1008
    sget-short v6, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_DEVICE_flag:S

    const/16 v7, 0x90

    if-ne v6, v7, :cond_0

    sget-short v6, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/16 v7, 0xa9

    if-ne v6, v7, :cond_0

    .line 1010
    invoke-direct {p0, p1, p3, p4}, Lcom/android/providers/telephony/GsmApnProvider;->isExistingDefaultApn(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    const/4 v0, 0x1

    .line 1013
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/android/providers/telephony/GsmApnProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 1014
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v6, Lcom/android/providers/telephony/GsmApnProvider;->s_urlMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v6, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v4

    .line 1015
    .local v4, match:I
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v5

    .line 1017
    .local v5, pid:I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", update match="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", values=\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\", where=\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1019
    packed-switch v4, :pswitch_data_0

    .line 1084
    :pswitch_0
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cannot update that URL: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1010
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v4           #match:I
    .end local v5           #pid:I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1023
    .restart local v2       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v4       #match:I
    .restart local v5       #pid:I
    :pswitch_1
    if-eqz v0, :cond_2

    .line 1024
    const-string v6, "carriers"

    invoke-virtual {v2, v6, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1088
    :cond_2
    :goto_1
    if-lez v1, :cond_3

    .line 1089
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", update match="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " , count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1090
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    sget-object v7, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1091
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    sget-object v7, Landroid/provider/Telephony$GsmCarriers;->CONTENT_URI:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    :cond_3
    move v6, v1

    .line 1094
    :goto_2
    return v6

    .line 1031
    :pswitch_2
    if-eqz v0, :cond_2

    .line 1032
    const-string v6, "carriers"

    invoke-virtual {v2, v6, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_1

    .line 1039
    :pswitch_3
    if-eqz v0, :cond_2

    .line 1040
    if-nez p3, :cond_4

    if-eqz p4, :cond_5

    .line 1041
    :cond_4
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cannot update URL "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " with a where clause"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1044
    :cond_5
    const-string v6, "carriers"

    const-string v7, "_id=?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v2, v6, p2, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto/16 :goto_1

    .line 1052
    :pswitch_4
    if-eqz p2, :cond_2

    .line 1053
    const-string v6, "apn_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1054
    const-string v6, "apn_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredApnId(Ljava/lang/Long;)V

    .line 1055
    const/4 v1, 0x1

    goto/16 :goto_1

    .line 1063
    :pswitch_5
    if-eqz p2, :cond_2

    .line 1064
    const-string v6, "dun_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1065
    const-string v6, "dun_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/providers/telephony/GsmApnProvider;->setPreferredDunId(Ljava/lang/Long;)V

    .line 1066
    const/4 v1, 0x1

    goto/16 :goto_1

    .line 1073
    :pswitch_6
    if-eqz p2, :cond_6

    .line 1074
    invoke-virtual {p0}, Lcom/android/providers/telephony/GsmApnProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "MSG_FORWARD_INFO"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 1075
    .local v3, editor:Landroid/content/SharedPreferences$Editor;
    const-string v6, "forward_phone_number"

    const-string v7, "forward_phone_number"

    invoke-virtual {p2, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1076
    const-string v6, "forward_phone_time_stamp"

    const-string v7, "forward_phone_time_stamp"

    invoke-virtual {p2, v7}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {v3, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1077
    const-string v6, "forward_emial_address"

    const-string v7, "forward_emial_address"

    invoke-virtual {p2, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1078
    const-string v6, "forward_email_time_stamp"

    const-string v7, "forward_email_time_stamp"

    invoke-virtual {p2, v7}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {v3, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1079
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1081
    .end local v3           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", update match="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " 1 end"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/providers/telephony/GsmApnProvider;->Log(Ljava/lang/String;)V

    .line 1082
    const/4 v6, 0x1

    goto/16 :goto_2

    .line 1019
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method
