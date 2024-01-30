import { $ } from "bun";

const batteryPath = "/sys/class/power_supply/BAT1";
const batteryPercentage = parseInt(await $`cat ${batteryPath}/capacity`.text());
const chargingStatus = await $`cat ${batteryPath}/status`
	.text()
	.then((value) => value.trim());

if (isNaN(batteryPercentage)) {
	console.error("Erro ao obter a porcentagem da bateria.");
} else if (batteryPercentage <= 10 && chargingStatus === "Discharging") {
	await $`notify-send -u critical Conecte o notebook na tomada, a bateria está em ${batteryPercentage}%!`;
} else if (chargingStatus === "Charging") {
	console.info("[batteryChecker] A bateria está carregando no momento!");
} else {
	console.info(
		`[batteryChecker] A bateria atualmente está em ${batteryPercentage}%, portanto, não é preciso verificar`,
	);
}
